;; 10. **Test for Label Index Mismatch in Deep Nesting**: Structure deeply nested control blocks and ensure the `br` instruction targets an incorrect label with mismatched types from several layers deep. This will test the robustness of proper relative label indexing and type validation in nested contexts.

(assert_invalid
  (module
    (func (param i32)
      (block 
        (loop 
          (block 
            (block
              (br 3 (i32.const 0)) 
            )
          )
        )
      )
    )
  )
  "unknown label"
)