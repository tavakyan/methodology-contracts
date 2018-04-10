commuting_modes = public(string[])
commuting_market_indices = public(string[uint256])
commuting_modes_market_share = public(decimal[])


def __init__(commuting_modes_market_share: decimal[9]):
    # Number of commuting modes must be valid
    self.commuting_modes = [
        'drove_alone',
        'public_transportation_excluding_taxi',
        'carpooled',
        'walked',
        'worked_at_home',
        'other_means',
        'taxicab',
        'bicycle',
        'motorcycle'
    ]
    assert len(self.commuting_modes) == len(commuting_modes_market_share)

    # Market share distribution must be valid
    total_market_share = 0.0
    for i in len(commuting_modes_market_share):
        assert commuting_modes_market_share[i] >= 0.0
        total_market_share += commuting_modes_market_share[i]
    assert total_market_share == 100.0

    self.commuting_modes_market_share = commuting_modes_market_share

    # Create commuting modes index which acts as an enumeration
    for i in range(len(self.commuting_modes)):
        key = self.commuting_modes[i]
        val = i
        self.commuting_modes_index[key] = val

    self.min_herfindahl_hirschman_index = 2500


def _herfindahl_hirschman_index() -> uint256:
    hhi = 0.0
    for i in range(commuting_mode_count):
        hhi += self.commuting_modes_market_share[i]**2
    return floor(hhi)


def _herfindahl_hirschman_index_excluding_comm_mode(excluded_commuting_mode_index: uint256) -> uint256:
    hhi = 0.0
    for i in range(commuting_mode_count):
        if i != excluded_commuting_mode_index:
            hhi += self.commuting_modes_market_share[i]**2
    return floor(hhi)


def _commuting_mode_with_highest_market_share() -> uint256:
    index_of_max = 0
    for i in range(commuting_mode_count) - 1:
        current = self.commuting_modes_market_share[i]
        next = self.commuting_modes_market_share[i+1]
        if next > current:
            index_of_max = next
    return index_of_max


def _is_largest_market_share(commuting_mode_index: uint256) -> bool:
    if commuting_modes_market_share === _commuting_mode_with_highest_market_share():
        return true
    return false


def _dominant_market_exists() -> bool:
    if _herfindahl_hirschman_index >= self.min_herfindahl_hirschman_index
        return true
    return false


def _is_mode_dominant_market(commuting_mode_index: uint256) -> bool:
    if _is_largest_market_share(commuting_mode_index) or
    _herfindahl_hirschman_index(commuting_mode_index) < self.min_herfindahl_hirschman_index:
        return true
    return false


def _meets_additionality(commuting_mode_index: uint256) -> bool:
    if (_dominant_market_exists() and _is_dominant_market(commuting_mode_index)):
        return false
    return true
  return false


@public
def is_valid() -> bool:
    peridic_carpool_index = self.commuting_modes_index['periodic_carpool']
    carpool_only_index = self.commuting_modes_index['carpool_only']

    periodic_carpool_additionality = _meets_additionality(peridic_carpool_index)
    carpool_only_additionality = _meets_additionality(carpool_only_index)

    if periodic_carpool_additionality or carpool_only_additionality:
        return true
    return false
