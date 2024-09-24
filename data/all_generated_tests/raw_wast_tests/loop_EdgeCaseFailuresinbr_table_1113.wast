;; - **Test 4**: Place a `br_table` instruction inside a loop with multiple nested blocks and use a very large index to simulate overflow. Analyze the specific error responses generated by WebAssembly and Wizard Engine, verifying the adherence to boundary constraints.

(assert_invalid
  (module
    (func $index-overflow
      (loop (result i32)
        (block
          (br_table 1 0 2 (i32.const 4294967295))
        )
      )
    )
  )
  "br_table target out of bounds"
)