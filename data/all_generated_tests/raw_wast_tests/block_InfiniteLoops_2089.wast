;; 10. Form a `block` incorporating a `loop` and various `br_if` instructions with alternating true/false conditions designed to check wizard_engine's switch-case pattern, leading to one path not breaking correctly and causing an infinite loop.

(assert_invalid
  (module
    (func $test-infinite-loop (result i32)
      (block (result i32)
        (loop (result i32)
          (br_if 1 (i32.const 1))
          (br_if 0 (i32.const 0))
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)