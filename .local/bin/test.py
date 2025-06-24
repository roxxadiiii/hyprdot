import json

def generate_markdown(websites, filename="web_resources.md"):
    markdown_content = "# 📂 Web Resources Collection\n\n"
    categories = {}

    for site in websites:
        category = site.get("category", "Miscellaneous")
        if category not in categories:
            categories[category] = []
        categories[category].append(site)

    for category, sites in categories.items():
        markdown_content += f"## {category}\n"
        for site in sites:
            markdown_content += f"### [{site['title']}]({site['url']})\n"
            markdown_content += f"- **Description:** {site['description']}\n"
            markdown_content += f"- **Tags:** {' '.join([f'`#{tag}`' for tag in site['tags']])}\n\n"

    with open(filename, "w", encoding="utf-8") as file:
        file.write(markdown_content)
    print(f"Markdown file '{filename}' has been generated successfully!")

# Function to take user input
def get_user_input():
    websites = []
    while True:
        title = input("Enter website title (or type 'done' to finish): ")
        if title.lower() == 'done':
            break
        url = input("Enter website URL: ")
        description = input("Enter description: ")
        tags = input("Enter tags (comma-separated): ").split(',')
        category = input("Enter category: ")
        
        websites.append({
            "title": title.strip(),
            "url": url.strip(),
            "description": description.strip(),
            "tags": [tag.strip() for tag in tags],
            "category": category.strip()
        })
    return websites

# Get user input and generate markdown
websites = get_user_input()
generate_markdown(websites)

