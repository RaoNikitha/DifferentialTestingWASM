;; 5. Construct an infinite loop test where `br_if` has to reference a label beyond the nearest outermost block. The WASM implementation should handle this correctly, but `wizard_engine` could fail due to faulty side-table management.

(assert_invalid
  (module
    (func $infinite-loop-label
      (block $outer
        (loop $inner
          (br_if 1 (i32.const 1))
          (block
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "invalid label"
)