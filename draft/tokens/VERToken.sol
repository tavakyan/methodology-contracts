// Voluntary Market Tokens
contract VERToken is C4Token {

}

// Not sure if a property can be passed in through constructor or we shoudl have two impls.
// for on-chain and off-chain VERs
contract VEROnChainToken is VERToken {

}

contract VEROffChainToken is VERToken {

}
