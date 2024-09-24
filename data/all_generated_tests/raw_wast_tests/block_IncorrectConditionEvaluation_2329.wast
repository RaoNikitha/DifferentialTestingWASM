;; Test 10: Design a deep-nested block structure with several `if-else` conditions using `br_if`. Test the control flow to ensure each condition is evaluated correctly and the appropriate block branches are taken without errors.

(assert_invalid
  (module (func $deep-nested-if-else-control (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_if 0 (i32.const 0))
            (block (result i32)
              (br_if 0 (i32.const 1))
              (br 2 (i32.const 2))
            )
            (br_if 1 (i32.const 3))
          )
          (br_if 1 (i32.const 4))
        )
        (br_if 1 (i32.const 5))
      )
      (br_if 1 (i32.const 6))
    )
  ))
  "unreachable block"
)