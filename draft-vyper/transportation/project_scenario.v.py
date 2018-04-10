def __init__(baseline_scenario, project_scenario, leakage_scenario):
    self.baseline_scenario = baseline
    self.project_scenario = project
    self.leakage_scenario = leakage_scenario

def baseline_emissions() -> decimal:
    pass


def leakage_emissions() -> decimal:
    pass


def project_emissions() -> decimal:
    pass


def emissions_reduction() -> decimal:
    be = baseline_emissions()
    le = leakage_emissions()
    pe = project_emissions()
    er = be - pe - le
    assert er > 0
    return er
