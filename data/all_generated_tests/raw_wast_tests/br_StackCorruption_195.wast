;; 6. **Interleaved Branch Targeting:**    Design a scenario where branches within multiple interleaved blocks and loops target outer labels, ensuring the branched-to labels require different operand types. This will test the robustness of both implementations in maintaining stack integrity.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (block (result i32)
              (br 2)
              (i32.const 1)
              (drop)
            )
            (i32.const 1) ; Operand for the targeting loop
            (br 0)
          )
          (br 1) ; Incorrect targeting with mismatched operand types
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)