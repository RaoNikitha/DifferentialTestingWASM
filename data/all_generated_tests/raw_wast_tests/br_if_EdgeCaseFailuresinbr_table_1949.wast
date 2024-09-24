;; 10. **Test Description**: Construct a `br_if` within a `loop` to conditionally jump to a `block` having a different result type than the loop’s input type. Paired with a `br_table` using dynamically changing out-of-bound indexes. Check `wizard_engine`'s explicit label arguments handling in contrast to WASM's implicit type transformations.

(assert_invalid
  (module
    (func $differential_br_if_br_table
      (loop (result i32)
        (block (result f64)
          (block
            (br_if 1 (i32.const 0))
          )
          (br_table 0 1 2 (i32.const 3))
        )
      )
    )
  )
  "type mismatch"
)