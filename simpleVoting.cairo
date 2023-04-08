#[contract] //Keyword to show that it's a Cairo contract
 
//mod - keyword defining a module
mod Voting {
    use starknet::get_caller_address;
    use starknet::ContractAddress;

    struct Storage {
        name: felt252,
        //Mapping between voters and proposals
        //vote: LegacyMap::<ContractAddress, u128>,
        proposalVotes: LegacyMap::<u128, felt252>,
    }

    //Populate the proposals array with a few default proposals
    #[constructor]
    fn constructor(_name: felt252, _counter: u128) {
        
        //Initialise the proposal with 0 votes
        proposalVotes::write(_counter, 0);
        name::write(_name);

    }

    #[external]
    fn addProposals(_counter: u128) {
        proposalVotes::write(_counter, 0);
    }

    #[external]
    fn voteOnProposal(prop_num: u128) {

        let mut votes = proposalVotes::read(prop_num);
        votes = votes + 1;

        proposalVotes::write(prop_num, votes);
    }

    #[view]
    fn getVotesForProposal(prop_num: u128) -> felt252 {
      proposalVotes::read(prop_num)
    }

    //TODO - get voted proposal for a particular voted

}
