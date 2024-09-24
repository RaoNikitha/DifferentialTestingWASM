;; 5. A test where `loop` contains both `br_if` and `br` instructions in a sequence before `return`, setting unreachable paths. Validate improper exits or unhandled stack states causing infinite loop behavior.

(assert_invalid
  (module
    (func $loop-br_if-br-return
      (loop (br_if 0 (i32.const 0)) (br 0))
      (return)
    )
  )
  "unreachable code"
)