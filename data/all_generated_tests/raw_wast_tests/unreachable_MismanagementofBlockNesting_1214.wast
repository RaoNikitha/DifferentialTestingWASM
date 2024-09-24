;; 5. Use an `unreachable` right after entering a nested `block` within another `block` and `loop` context, followed by a `br_if` to simulate partial block exits, checking if control jumps correctly without executing further instructions.

(assert_invalid
  (module
    (func $test-unreachable-inside-nested-block (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (unreachable)
            (br_if 0 (i32.const 1))
          )
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)