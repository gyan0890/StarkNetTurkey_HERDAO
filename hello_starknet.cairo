#[contract]
mod HelloStarknet {
    use starknet::get_caller_address;
    use starknet::ContractAddress;


    #[event]
    fn Hello(from: ContractAddress, value: felt252) {}


    #[external]
    fn say_hello(message: felt252) {
        let caller = get_caller_address();
        Hello(caller, message);
    }

}
