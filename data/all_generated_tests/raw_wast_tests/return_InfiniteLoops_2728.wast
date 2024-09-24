;; Write a test involving a loop that uses both `br` and `return` instructions. If `br` fails to correctly transfer control and the `return` is incorrectly handled, the loop should not terminate.

(assert_invalid
  (module
    (func $loop-br-return (result i32)
      (loop (result i32)
        (i32.const 1)
        (br 0 (return (i32.const 42)))
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)