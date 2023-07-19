# Admin creates a poll
export EXECUTE_CREATE_POLL='{"create_poll":{"one_address":"option1","two_address":"option2","three_address":"option3"}}'
ibctl exec wasm wasmd tx wasm execute wasm14hj2tavq8fpesdwxxcu44rty3hh90vhujrvcmstl4zr3txmfvw9s0phg4d $EXECUTE_CREATE_POLL -- --from wasm158z04naus5r3vcanureh7u0ngs5q4l0gkwegr4 --keyring-backend test --chain-id wasm --gas auto --gas-adjustment 1.2 --yes

# Query the poll to see if successful
export QUERY_GET_POLL='{"get_poll":{"poll_id":1}}'
ibctl exec wasm wasmd q wasm contract-state smart wasm14hj2tavq8fpesdwxxcu44rty3hh90vhujrvcmstl4zr3txmfvw9s0phg4d

# Any account can pass a vote
export EXECUTE_VOTE='{"vote":{"poll_id":1, "choice":"option2"}}'
ibctl exec wasm wasmd tx wasm execute wasm14hj2tavq8fpesdwxxcu44rty3hh90vhujrvcmstl4zr3txmfvw9s0phg4d $EXECUTE_VOTE -- --from wasm158z04naus5r3vcanureh7u0ngs5q4l0gkwegr4 --keyring-backend test --chain-id wasm --gas auto --gas-adjustment 1.2 --yes

# Only the admin can end the poll
export EXECUTE_END_POLL='{"end_poll":{"poll_id":1}}'
ibctl exec wasm wasmd tx wasm execute wasm14hj2tavq8fpesdwxxcu44rty3hh90vhujrvcmstl4zr3txmfvw9s0phg4d $EXECUTE_END_POLL -- --from wasm158z04naus5r3vcanureh7u0ngs5q4l0gkwegr4 --keyring-backend test --chain-id wasm --gas auto --gas-adjustment 1.2 --yes

# When the poll has ended AND a channel is created, we can send the IBC packet with poll info
export EXECUTE_SEND_POLL_RESULT='{"send_poll_result":{"channel":"channel-0", "poll_id": 1, "voted_address": "option2"}}'
ibctl exec wasm wasmd tx wasm execute wasm14hj2tavq8fpesdwxxcu44rty3hh90vhujrvcmstl4zr3txmfvw9s0phg4d $EXECUTE_SEND_POLL_RESULT -- --from wasm158z04naus5r3vcanureh7u0ngs5q4l0gkwegr4 --keyring-backend test --chain-id wasm --gas auto --gas-adjustment 1.2 --yes