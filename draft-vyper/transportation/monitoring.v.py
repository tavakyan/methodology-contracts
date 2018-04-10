project_start: public(timestamp)
project_end: public(timestamp)


def __init__(project_start: timestamp):
    assert project_start > now()

    self.baseline_service = baseline_service
    self.additionality = additionality

    seconds_per_year = 60*60*24*365
    self.project_start = project_start
    self.project_end = project_start + timedelta(seconds_per_year)
