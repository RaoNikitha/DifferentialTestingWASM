;; 7. **Test Description:** A series of nested `block` constructs where `unreachable` is within one block, with surrounding blocks having valid `return` statements. This checks if the return values and states of outer blocks are preserved correctly.        **Constraint Checked:** Stack state and return value integrity in nested blocks with `unreachable`.

(assert_invalid
  (module (func $nested-blocks-unreachable (result i32)
    (block (result i32)
      (block (br 1 (i32.const 42)))
      (block (unreachable))
    )
  ))
  "type mismatch"
)