;; 1. Create a `block` instruction that expects an integer on the stack, but the branch inside the block conditionally triggers an `unreachable` instruction when no integer is present. This checks for stack operand compliance.

(assert_invalid
  (module 
    (func $invalid-block (param i32)
      (block (result i32)
        (br_if 0 (i32.const 1)) 
        (unreachable))
  ))
  "type mismatch"
)