;; 2. Define a set of nested blocks with `unreachable` inside the innermost block. After the `unreachable` instruction, add operations that manipulate the stack and check if these operations are ignored due to the trap.

(assert_invalid
  (module (func $unreachable-nested-blocks
    (block (block (block 
      (unreachable)
      (i32.const 42) 
    )))
  ))
  "type mismatch"
)