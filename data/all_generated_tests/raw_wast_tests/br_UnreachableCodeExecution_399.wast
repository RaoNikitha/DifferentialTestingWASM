;; 10. A mixture of `block`, `loop`, and `if` constructs, with a `br` targeting an outer `block` from deep within nested constructs, with `unreachable` instructions scattered throughout the constructs. This comprehensive scenario tests correct structured control, label indexing, and operand stack handling to avoid unintended unreachable execution.

(assert_invalid
  (module
    (func $complex-nesting
      (block (result i32)
        (loop
          (block (result i32)
            (if (result i32)
              (then
                (block
                  (br 2) 
                )
              )
              (else
                (unreachable)
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)