;; 2. Test an `if` instruction nested within a loop where the `if` leads to a break from the loop. Verify correct stack behavior and control flow when bypassing the loop due to an `else` condition. ```wasm (loop   (if     (i32.const 0)      (then (br 1))      (else (nop))   ) ) ```

(assert_invalid
  (module (func (loop 
    (if (result i32) (i32.const 0) 
      (then (br 1)) 
      (else (nop))
    )
  )))
  "type mismatch"
)