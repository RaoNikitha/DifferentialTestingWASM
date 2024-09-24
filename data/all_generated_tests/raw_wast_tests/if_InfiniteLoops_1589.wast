;; 10. Develop a complex nested structure involving multiple `if`, `else`, `end` terms leading into branched looping. Intentionally cause improper context handling that a procedural and declarative discrepancy would treat variate infinite looping conditions.

(assert_invalid
  (module
    (func $complex_nested_structure
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32)
            (i32.const 1)
            (then
              (loop (result i32)
                (br_if 0 (i32.const 0))
                (if (i32.const 1) (then (br 1))))))))
        (else
          (if (result i32)
            (i32.const 1)
            (then
              (br 0)
            (end))
            (else
              (loop (result i32)
                (br_if 0 (i32.const 0))
                (br 1)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)