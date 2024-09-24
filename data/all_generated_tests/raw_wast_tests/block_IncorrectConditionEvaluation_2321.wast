;; Test 2: Design a test where a block contains an `if` statement with a `br_if` that checks for a local variable set to `1`. The block should have nested `block` instructions, ensuring the correct branch is taken based on the condition.

(assert_invalid
  (module
    (func $nested-blocks
      (local i32)
      (set_local 0 (i32.const 1))
      (block (result i32)
        (block
          (block (result i32)
            (i32.const 2)
            (if (result i32) (i32.eqz (get_local 0))
              (then (br 2))
              (else (drop) (i32.const 3))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)