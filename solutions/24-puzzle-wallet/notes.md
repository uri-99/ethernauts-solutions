PuzzleWallet
- cualquier whitelisted puede ser owner si corre setMaxBalance(0) y después init(x)
- owner:        0x5ef1FFD3b864FEe330EB6f28A55f333D68C4cc16
- maxBalance :  542041897727881165278186437094079267507334859798
- whitelisteds: 
- balances: owner: 1000000000000000

De puzzleWallet no puedo hacer nada todavía, la primera punta tiene que estar en el PuzzleProxy

PuzzleProxy
- admin: 0x5ef1FFD3b864FEe330EB6f28A55f333D68C4cc16
- pendingAdmin: 0x5ef1FFD3b864FEe330EB6f28A55f333D68C4cc16 -> ahora es el mío
puedo correr proposeNewAdmin, ahora lo hago
- pendingAdmin: $PRIMERY_ADDRESS

ah pero PuzzleProxy le hace delegatecall a PuzzleWallet. eso no hace que owner es storage_slot_1 ? osea yo si soy pendingAdmin, soy owner de PuzzleWallet.

Efectivamente.

PuzzleWallet Owner: $PRRIMARY_ADDRESS

A ver que puedo hacer ahora siendo owner de PuzzleWallet, quiero ser el ProxyAdmin.

Me hago whitelist a mi mismo. done.

No puedo setMaxBalance como mi address porque el contract tiene fondos, y no los puedo quitar aunque sea owner xq esos fondos son del previo owner.

Buen dato: execute() hace un regular call pero multicall() hace un delegateCall:
- Con storage de PuzzleProxy
- Código de PuzzleWallet

Si PuzzleProxy no tiene fondos, podría setMaxBalance(uint256 _maxBalance) con parametro mi address, reescribir slot_2 de PuzzleProxy y ser el nuevo admin.

Entonces tengo que drenar el PuzzleProxy, llamando 2 veces el deposit:
- multicall(deposit, multicall(deposit))

Listo, contract drained. ahora setMaxBalance(myAddress) y listo.
