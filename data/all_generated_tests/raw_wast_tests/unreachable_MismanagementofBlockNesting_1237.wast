;; 8. **Test Description:** Nested `block` and `loop` with `br_if` leading control flow towards an `unreachable` instruction. The purpose is to see if selective branching correctly manages the stack and does not prematurely trap in unintended blocks.        **Constraint Checked:** Conditional branch stack state management in the presence of `unreachable`.

(assert_invalid
  (module (func $test
    (block (result i32)
      (block (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0))
        (loop (result i32)
          (unreachable)
          (i32.const 2)
        )
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)