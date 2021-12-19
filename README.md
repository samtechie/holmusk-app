# Holmusk App

An Elm App with these [specifications](https://www.notion.so/Dropdowns-Elm-a942d87b245e42a3b35619f582f34a01)

### Running the app

Install the components:

```bash
$ npm install
```

Start up a server:

```bash
$ npm start
```

## Notes

This project is created with this Elm + Bulma + Parcel [project template](https://github.com/haraldmaida/elm-bulma-parcel-starter)

### Requirements implemented

-   There are 4 dropdown menus in the page one for each of the sections (the four sections are called: overall, category 1, category 2, and category 3)
-   Each dropdown has a list of options (~10), each of which can be selected and de-selected through a checkbox
-   Each dropdown can be opened by clicking on it
-   Selecting/deselecting a checkbox should not close the dropdown
-   Selected options should show as text in the respective section
-   Use Bulma as the main css framework

### Pending Requirements

-   Clicking anywhere outside of the dropdown should close it (For now you have to click on the dropdown button to close it)
-   Improve on design
