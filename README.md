# SARS-CoV-2 Data Repository for the Ontario Wastewater Surveillance Consortium (OWSC)

## Description
This is a repository for SARS-CoV-2 viral load data in Ontario, Canada. The format of the data is the Public Health Environmental Surveillance Open Data Model ([PHES-ODM](https://github.com/Big-Life-Lab/PHES-ODM)). The ODM files are stored in the CSV directory and can be generated from Excel workbooks using the Python script `convert_excel.py`.

## Converting from Excel to CSV

Files can be converted from Excel to CSV using the which utilizes the `convert_excel.py` script, which uses the [pyODM](https://github.com/DeGrootResearchGroup/pyODM) tool. This tool assumes that the Excel sheets are named `<filename_body>_<lab_name>.xlsx` where `<filename_body>` can be any string and `<lab_name>` is the name of the contributing lab. CSV files will be organized in folders according to the `<lab_name>` string. To use this tool, it is recommended to first create a virtual environment and then install required packages from the `requirements.txt` file.

First, create a virtual environment called `env`:
```
python -m venv env
```

Then, activate the environment:
```
source env/bin/activate
```

Finally, install the required packages:
```
python -m pip install -r requirements.txt
```

Note: it is assumed here that `python` points to `python3`; if your system is set up differently, you may have to directly call `python3` in the commands listed above.

## Contributing

Data contributions are accepted only from members of the OWSC. To make a data contribution, propose a change through a pull request (PR) to the `dev` branch. Changes must be reviewed by at least one other member of the OWSC prior to merging into the `dev` branch. Periodically, changes from the `dev` branch will be merged into to `main` branch, in consultation with the OWSC. To suggest a data correction, make a PR to the `bug-fixes` branch. These will be merged with the `main` branch on a more regular basis to ensure any errors are corrected promptly.

If an error is noted in any of the data, users are requested to open a new issue for the OWSC to review and correct as necessary.
