import pygame
import time
import json
import math
import random

# Initialize Pygame
pygame.init()

# Screen dimensions
WIDTH, HEIGHT = 800, 600
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Virtudex OS")

# Colors
RED = (200, 0, 0)  # Darker red for background
DARK_RED = (150, 0, 0)  # Darker red for wave
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
GREY = (50, 50, 50)

# Fonts
font = pygame.font.Font(None, 64)
small_font = pygame.font.Font(None, 32)
bold_font = pygame.font.Font(None, 32)
bold_font.set_bold(True)

VERSION = "Alpha Build : 0.003"

# Load Game Data (Items and Owned Virtumon)
try:
    with open("data/virtumon.json", "r") as f:
        all_virtumon_data = json.load(f)
except FileNotFoundError:
    print("Error: virtumon.json not found. Creating empty data.")
    all_virtumon_data = []
except json.JSONDecodeError:
    print("Error: virtumon.json is not valid JSON. Creating empty data.")
    all_virtumon_data = []

try:
    with open("data/items.json", "r") as f:
        item_data = json.load(f)
except FileNotFoundError:
    print("Error: items.json not found. Creating empty data.")
    item_data = []
except json.JSONDecodeError:
    print("Error: items.json is not valid JSON. Creating empty data.")
    item_data = []

# Example owned data (You would load this from a save file later)
owned_virtumon = ["001", "007", "012"]
owned_items = ["potion", "super_potion", "revive"]

# Fade function
def fade_to_color(start_color, end_color, duration=1):
    steps = 50
    r_step = (end_color[0] - start_color[0]) / steps
    g_step = (end_color[1] - start_color[1]) / steps
    b_step = (end_color[2] - start_color[2]) / steps

    for i in range(steps + 1):
        current_color = (int(start_color[0] + r_step * i),
                         int(start_color[1] + g_step * i),
                         int(start_color[2] + b_step * i))
        screen.fill(current_color)
        text = font.render("Virtudex OS", True, WHITE)
        text_rect = text.get_rect(center=(WIDTH // 2, HEIGHT // 2))
        screen.blit(text, text_rect)
        pygame.display.flip()
        time.sleep(duration / steps)

def draw_version():
    version_text = small_font.render(VERSION, True, WHITE)
    version_rect = version_text.get_rect(bottomright=(WIDTH - 10, HEIGHT - 10))
    screen.blit(version_text, version_rect)

# Helper function to draw menu tabs
def draw_menu_tabs(current_screen):
    pygame.draw.rect(screen, WHITE, (0, 0, WIDTH, 50))  # White bar for menu

    # Load icons (replace with actual icon loading)
    try:
        home_icon = pygame.image.load("assets/icons/home.png")  # Replace with actual icon path
        inventory_icon = pygame.image.load("assets/icons/inventory.png")
        virtumon_icon = pygame.image.load("assets/icons/virtumon.png")
        settings_icon = pygame.image.load("assets/icons/settings.png")
    except pygame.error as e:
        print(f"Error loading icons: {e}")
        return

    # Resize icons (adjust size as needed)
    icon_size = 32
    home_icon = pygame.transform.scale(home_icon, (icon_size, icon_size))
    inventory_icon = pygame.transform.scale(inventory_icon, (icon_size, icon_size))
    virtumon_icon = pygame.transform.scale(virtumon_icon, (icon_size, icon_size))
    settings_icon = pygame.transform.scale(settings_icon, (icon_size, icon_size))

    # Create a list of tabs
    tabs = [
        {"text": "Home", "icon": home_icon},
        {"text": "Inventory", "icon": inventory_icon},
        {"text": "Virtumon", "icon": virtumon_icon},
        {"text": "Settings", "icon": settings_icon}
    ]

    for i, tab in enumerate(tabs):
        x = i * WIDTH // 4 + 10
        tab_rect = pygame.Rect(x, 0, WIDTH // 4 - 10, 50)

        # Highlight the current tab
        if current_screen == tab["text"].lower():
            pygame.draw.rect(screen, GREY, tab_rect, 2)  # Add a border to highlight

        # Render text
        text_surface = bold_font.render(tab["text"], True, BLACK)
        text_rect = text_surface.get_rect(midleft=(x + icon_size + 10, 25))
        screen.blit(text_surface, text_rect)

        # Blit icon (positioned to the left of text)
        icon_rect = tab["icon"].get_rect(midleft=(x, 25))
        screen.blit(tab["icon"], icon_rect)

def handle_events():
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            return "quit"
        if event.type == pygame.MOUSEBUTTONDOWN:
            x, y = pygame.mouse.get_pos()
            tab_width = WIDTH // 4
            if 0 < x < tab_width:
                return "home"
            elif tab_width < x < tab_width * 2:
                return "inventory"
            elif tab_width * 2 < x < tab_width * 3:
                return "virtumon"
            elif tab_width * 3 < x < WIDTH:
                return "settings"
    return None

# Interface functions
def home_interface():
    running = True

    # Generate random triangles
    num_triangles = 20
    triangles = []
    for _ in range(num_triangles):
        point1 = (random.randint(0, WIDTH), random.randint(0, HEIGHT))
        point2 = (random.randint(0, WIDTH), random.randint(0, HEIGHT))
        point3 = (random.randint(0, WIDTH), random.randint(0, HEIGHT))
        triangles.append([point1, point2, point3])

    while running:
        screen.fill(RED)

        # Draw random triangles
        for triangle in triangles:
            pygame.draw.polygon(screen, DARK_RED, triangle)

        draw_menu_tabs("home")
        text = small_font.render("Virtumon Stats | Time | Battery | Friends | News", True, WHITE)
        text_rect = text.get_rect(center=(WIDTH // 2, HEIGHT // 2))
        screen.blit(text, text_rect)
        draw_version()

        current_screen = handle_events()
        if current_screen == "quit":
            return "quit"
        elif current_screen:
            return current_screen
        pygame.display.flip()

def inventory_interface():
    running = True
    grid_x, grid_y = 50, 100
    cell_size = 80
    grid_padding = 20

    def draw_inventory():
        screen.fill(RED)
        draw_menu_tabs("inventory")

        for row in range(3):
            for col in range(5):
                rect = pygame.Rect(grid_x + col * (cell_size + grid_padding), grid_y + row * (cell_size + grid_padding), cell_size, cell_size)
                pygame.draw.rect(screen, BLACK, rect, 1)
                item_index = row * 5 + col
                if item_index < len(owned_items):  # Only draw owned items
                    item_id = owned_items[item_index]
                    for item in item_data:
                        if item["id"] == item_id:
                            name_text = small_font.render(item["name"], True, BLACK)
                            name_rect = name_text.get_rect(center=rect.center)
                            screen.blit(name_text, name_rect)
                            break

        draw_version()

    while running:
        draw_inventory()
        current_screen = handle_events()
        if current_screen:
            return current_screen
        pygame.display.flip()

def virtumon_interface(selected_index=0):
    running = True
    virtumon_width = 100
    virtumon_spacing = 20
    display_count = 3

    def draw_virtumon():
        screen.fill(RED)
        draw_menu_tabs("virtumon")

        displayed_virtumon = [virtumon for virtumon in all_virtumon_data if virtumon["id"] in owned_virtumon]

        if displayed_virtumon:
            start_x = (WIDTH - (len(displayed_virtumon) * virtumon_width + (len(displayed_virtumon) - 1) * virtumon_spacing)) // 2
            for i, virtumon in enumerate(displayed_virtumon):
                virtumon_rect = pygame.Rect(start_x + i * (virtumon_width + virtumon_spacing), 150, virtumon_width, virtumon_width)
                pygame.draw.rect(screen, BLACK, virtumon_rect, 1)
                name_text = small_font.render(virtumon["name"], True, BLACK)
                name_rect = name_text.get_rect(center=virtumon_rect.center)
                screen.blit(name_text, name_rect)

            selected_virtumon = displayed_virtumon[selected_index % len(displayed_virtumon)]
            info_rect = pygame.Rect(50, 300, WIDTH - 100, 250)
            pygame.draw.rect(screen, BLACK, info_rect, 1)

            info_text = [
                f"Name: {selected_virtumon['name']}",
                f"Type: {selected_virtumon.get('type', 'N/A')}",
                f"Attack: {selected_virtumon.get('attack', 'N/A')}",
                f"Defense: {selected_virtumon.get('defense', 'N/A')}",
                f"Health: {selected_virtumon.get('health', 'N/A')}",
                f"Virtudex Entry: {selected_virtumon.get('virtudex_entry', 'N/A')}",
            ]

            y_offset = info_rect.y + 20
            for line in info_text:
                text = small_font.render(line, True, BLACK)
                text_rect = text.get_rect(x=info_rect.x + 20, y=y_offset)
                screen.blit(text, text_rect)
                y_offset += 30
        draw_version()

    while running:
        draw_virtumon()
        current_screen = handle_events()
        if current_screen:
            return current_screen

        # Mouse hover detection
        mouse_x, mouse_y = pygame.mouse.get_pos()
        if 150 < mouse_y < 250:
            if mouse_x < WIDTH // 3:
                selected_index = (selected_index - 1) % len(owned_virtumon)
                pygame.time.wait(int(1000 * 0.25))
            elif mouse_x > 2 * WIDTH // 3:
                selected_index = (selected_index + 1) % len(owned_virtumon)
                pygame.time.wait(int(1000 * 0.25))
        pygame.display.flip()

def settings_interface():
    running = True

    def draw_settings():
        screen.fill(RED)
        draw_menu_tabs("settings")

        # Settings Options (Example)
        settings_options = [
            "Sound: On/Off",
            "Brightness: 50%",  # Could be a slider later
            "Notifications: On/Off",
            "Account Settings",
            "About",
        ]

        y_offset = 100
        for option in settings_options:
            text = small_font.render(option, True, BLACK)
            text_rect = text.get_rect(x=100, y=y_offset)  # Align to the left
            screen.blit(text, text_rect)
            y_offset += 50
        draw_version()

    while running:
        draw_settings()
        current_screen = handle_events()
        if current_screen:
            return current_screen
        pygame.display.flip()

# Main execution
fade_to_color(WHITE, RED)
fade_to_color(RED, WHITE)

current_screen = "home"

while current_screen != "quit":
    if current_screen == "home":
        current_screen = home_interface()
    elif current_screen == "inventory":
        current_screen = inventory_interface()
    elif current_screen == "virtumon":
        current_screen = virtumon_interface()
    elif current_screen == "settings":
        current_screen = settings_interface()

pygame.quit()