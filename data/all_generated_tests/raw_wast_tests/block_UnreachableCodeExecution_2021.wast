;; 2. **Test Description**:    Design a `block` with nested `block` sequences where an inner block branches to an outer block’s end, terminating execution inside an outer block and hitting an `unreachable` instruction. This test ensures proper handling of nested branching and accurate trapping on `unreachable` within nested blocks.

(assert_invalid
  (module 
    (func
      (block (block (br 1) (unreachable)))
    )
  )
  "unreachable executed"
)