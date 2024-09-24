;; 3. Test nested `if` blocks where the outer `if` block has an `else` clause that contains another `if` block. Ensure proper control flow and stack management when the outer `if` evaluates to false. ```wasm (if (i32.const 0)   (then (nop))   (else      (if (i32.const 1) (then (nop)) (else (unreachable)))   ) ) ```

(assert_invalid
  (module (func
    (if (i32.const 0)
      (then (nop))
      (else
        (if (i32.const 1) (then (nop)) (else (unreachable)))
      )
    )
  ))
  "type mismatch"
)