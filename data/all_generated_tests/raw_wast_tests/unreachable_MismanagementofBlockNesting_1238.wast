;; 9. **Test Description:** Complex nested control flow with a `block` containing multiple `if-else` constructs and `unreachable` within one of the `else` branches. Ensures that the stack and control flow correctly address selective trapping without erroneous continuation.        **Constraint Checked:** Fine-grained conditional trapping and control flow management within nested constructs.

(assert_invalid
  (module (func $type-complex-nested-unreachable
    (block
      (if (i32.const 1)
        (then (i32.const 2))
        (else
          (unreachable)
          (i32.const 3)
        )
      )
      (i32.eqz)
      (drop)
    )
  ))
  "type mismatch"
)