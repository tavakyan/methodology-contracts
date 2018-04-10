# custom units proposal
# https://github.com/ethereum/vyper/issues/752
# in their backlog and will be implemented soon

# example:
# units = (
#     ("stock", "one ownership share"),
#     # "wei" comes for free (built-in)
# )
# stocks_count: int128("stock")
# wei_per_stock: int128("wei" / "stock")

# TODO: create units for methodology #KW/L, etc. 
units = (
    ("t_co2", "metric tonnes of CO2")
)
