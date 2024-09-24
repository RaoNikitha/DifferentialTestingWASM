;; 8. **Test Description:** A function includes an `if` block with a direct call to another function which contains nested blocks and a `br` instruction targeting the outer `if`.    **Constraint Checked:** The resolution of outward branch by `br` post a direct function call within an `if` block.    **Relation to Function Call/Return Handling:** Ensures stack unwinding and correct return post a `br` in an `if` context affected by a function call.

(assert_invalid
  (module
    (func $inner
      (block
        (block
          (br 1)
        )
      )
    )
    (func $type-mismatch-if-block
      (i32.const 0)
      (if (result i32)
        (then
          (call $inner)
          (br 0)
        )
        (else
          (i32.const 1)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)