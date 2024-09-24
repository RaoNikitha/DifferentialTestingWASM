;; 10. Test an `if` nested within another `if`, both having `else` branches. Ensure that when the outer `if` condition fails, control properly cascades into the inner. ```wasm (if (i32.const 0)   (then (nop))   (else     (if (i32.const 0)       (then (unreachable))       (else (nop))     )   ) ) ```

(assert_invalid
  (module
    (func
      (if (i32.const 0)
        (then (nop))
        (else
          (if (i32.const 0)
            (then (unreachable))
            (else (nop))
          )
        )
      )
    )
  )
  "type mismatch"
)