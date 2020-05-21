import arxiv
import pandas as pd

from jinja2 import Template

NOTES_DIR = "/home/robert/notes/paper_notes/"


def get_template():
    with open("template.jinja") as file_:
        template = Template(file_.read())
    return template


def get_df():
    # CSV needs File, url id fields
    # File is filename of textual note
    # url is arxiv url
    # id is arxiv id
    df = pd.read_csv("files_with_url.csv")
    return df


def get_notes(df)
    notes = []
    for item in df.iterrows():
        url = item[1].url
        file = item[1].File
        arxiv_id = item[1].id
        with open(f"{NOTES_DIR}{file}") as file_:
            file_contents = file_.read()
        print(file, arxiv_id)
        arxiv_obj = arxiv.query(id_list = [str(arxiv_id)])[0]
        pdf_url = url.replace("abs","pdf") + ".pdf"
        notes.append(dict(url=url, pdf_url=pdf_url, arxiv_id=arxiv_id, file_contents=file_contents,arxiv_obj=arxiv_obj))
    return notes


def complete_notes(notes):
    for note in notes:
        note["authors"] = note["arxiv_obj"]['authors']
        note["published"] = note["arxiv_obj"]["published"][:7]
        note["abs"] = note["arxiv_obj"]["summary_detail"]["value"].replace("\n", " ")
        note["notes"] = note["file_contents"].split("\n\n")[1:-1]
        note["tags"] = [tag.capitalize() for tag in note["file_contents"].split("\n\n")[-1].replace("#", "").replace("\n", "").replace("_", " ").split(", ")]
        note["title"] = note["arxiv_obj"]['title'].replace("\n", " ").replace("  ", " ").replace("  ", " ")
    return notes


def write_notes(notes, template):
    for note in notes:
        note_output = template.render(**note)
        with open(f"output/Paper: {note['title']}.md", "w") as file_:
            file_.write(note_output)


if __name__ == "__main__":
    template = get_template()
    df = get_df()
    notes = get_notes(df)
    notes = complete_notes(notes)
    write_notes(notes, template)
