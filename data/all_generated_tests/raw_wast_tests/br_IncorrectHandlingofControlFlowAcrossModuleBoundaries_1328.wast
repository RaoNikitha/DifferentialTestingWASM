;; 9. Test `br` instructions that forward branch to a `block` resumed after an `end` inside an imported function—evaluating the restored operand stack height consistency and ensuring proper execution resumption.

(assert_invalid
  (module
    (import "env" "func" (func $imported (result i32)))
    (func $test
      (block (result i32)
        (call $imported)
        (drop)
        (br 0 (i32.const 42))
      )
    )
  )
  "type mismatch"
)