;; 8. Test a nested `loop` within an `if` where the `else` clause runs the loop again in a nested configuration, validating proper loop restarts and stack height integrity. ```wasm (if (i32.const 0)   (then (unreachable))   (else     (loop       (if (i32.const 1)         (then (br 1))         (else (nop))       )     )   ) ) ```

(assert_invalid
  (module
    (func $nested-loop-if-else
      (if (i32.const 0)
        (then (unreachable))
        (else
          (loop
            (if (i32.const 1)
              (then (br 1))
              (else (nop))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)