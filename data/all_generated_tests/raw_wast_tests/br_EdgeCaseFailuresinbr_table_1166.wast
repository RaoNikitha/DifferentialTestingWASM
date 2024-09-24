;; 7. **Test with Maximum Nested Depth:**    - Construct a `br_table` within deeply nested `block` and `loop` structures to maximum allowable depth, testing the index targeting behavior.      - **Constraint Checked:** Ensures accurate handling of label indices in deeply nested contexts.      - **Edge Case Insight:** Addresses potential label resolution problems due to deep nesting.

(assert_invalid
  (module
    (func $max-nested-depth-test
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (block
                        (block
                          (block
                            (block
                              (block
                                (block
                                  (block
                                    (block
                                      (block
                                        (block
                                          (block
                                            (block
                                              (br_table 0 (i32.const 0))
                                            )
                                          )
                                        )
                                      )
                                    )
                                  )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)