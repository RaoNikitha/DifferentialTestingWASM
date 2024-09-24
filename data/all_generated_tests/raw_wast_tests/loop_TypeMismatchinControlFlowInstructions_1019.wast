;; 10. **Incorrect Terminal Type in `loop` Block**: Define a `loop` that ends with instructions producing a result type that does not match the block type's declared result. This will test the enforcement of declared result types against the actual types yielded by the loop's terminal instructions.

(assert_invalid
  (module (func (result i32)
    (loop (result i32)
      (i32.const 1)
      (br 0)
    )
  ))
  "type mismatch"
)