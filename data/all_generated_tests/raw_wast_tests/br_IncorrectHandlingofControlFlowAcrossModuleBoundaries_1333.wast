;; 4. **Test Description 4:**    - **Focus:** Incorrect indexing of labels across module boundary calls.    - **Constraint:** Ensure relative label indexing is correctly maintained when `br` instruction handles cross-module calls.    - **Incorrect Handling:** Improper label lookup due to incorrect relative indexing.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $incorrect-label-lookup
      (block $outer (result i32)
        (block $inner (result i32)
          (i32.const 42)
          (call $external_func)
          (br 2)  ;; Incorrect label indexing: should be 1
        )
      )
    )
  )
  "unknown label"
)