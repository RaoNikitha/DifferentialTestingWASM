;; 5. Use `unreachable` inside a `block` that conditionally returns different types (`i32` and `i64`). Create intentional type inconsistencies to see if the engines correctly identify and trap the error.

(assert_invalid
  (module (func $type-block-conditional (param i32) (result i32)
    (block (result i32)
      (if (result i32)
        (i32.const 1)
        (i64.const 1) ;; intentional mismatch
      )
      unreachable
    )
  ))
  "type mismatch"
)