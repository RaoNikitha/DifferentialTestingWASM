;; 6. Test deeply nested `if` structures with multiple `else` branches to ensure that false conditions correctly navigate out of the innermost block and into the appropriate `else`. ```wasm (block   (if     (i32.const 0)     (then (unreachable))     (else        (if         (i32.const 0)         (then (unreachable))         (else (nop))       )     )   ) ) ```

(assert_invalid
  (module
    (func $deep-nested-if
      (block
        (if
          (i32.const 0)
          (then (unreachable))
          (else
            (if
              (i32.const 0)
              (then (unreachable))
              (else (nop))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)