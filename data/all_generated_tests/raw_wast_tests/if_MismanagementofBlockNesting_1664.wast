;; 5. Test an `if` instruction within a `block` nested in another `if`, ensuring that a `br` in the innermost block correctly jumps to the correct label in the outer scope. ```wasm (if (i32.const 1)   (block     (if (i32.const 1)       (then (br 1))       (else (nop))     )   ) ) ```

(assert_invalid
  (module
    (func (if (i32.const 1)
      (block
        (if (i32.const 1)
          (then (br 1))
          (else (nop))
        )
      )
    ))
  )
  "type mismatch"
)