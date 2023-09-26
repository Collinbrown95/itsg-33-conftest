import os
import json
import yaml
from collections import defaultdict
from pathlib import Path


# Define the paths
json_file_path = Path("controls.json")  # Path to your JSON file
output_directory = Path(
    "..", "docs"
)

# Keep track of paths for the mkdocs file
mkdocs_yaml_path = Path("mkdocs_nav.yaml")
hierarchy = defaultdict(dict)

# Create the output directory if it doesn't exist
os.makedirs(output_directory, exist_ok=True)

# Load the JSON data
with open(json_file_path, "r") as json_file:
    data = json.load(json_file)

# Loop through the JSON objects
for index, obj in enumerate(data):
    # Create a filename based on some property of the JSON object (e.g., 'title')
    dir_path = Path(output_directory, obj["family"])
    filename = f"{obj['title'].replace(' ', '_').replace('/','').lower()}.md"
    os.makedirs(dir_path, exist_ok=True)
    # Add file path to hierarchy
    hierarchy[obj["family"]][obj["title"]] = f"{obj['family']}/{filename}"
    # Create the markdown content
    markdown_content = f"""
# ({obj['control']}) {obj['title']}

## Definition

{obj['definition']}

## Additional Guidance

{obj['additionalGuidance']}
"""

    # Write the content to the markdown file
    with open(Path(dir_path, filename), "w") as md_file:
        md_file.write(markdown_content)

    print(f"File {index+1} created: {filename}")

# Get yaml list from hierarchy
hierarchy = {
    "nav": [
        {
            outer_key: [{inner_key: value} for inner_key, value in inner_dict.items()],
        }
        for outer_key, inner_dict in hierarchy.items()
    ]
}

# Write hierarchy to yaml
with open(mkdocs_yaml_path, "w") as yaml_file:
    yaml.dump(hierarchy, yaml_file)
