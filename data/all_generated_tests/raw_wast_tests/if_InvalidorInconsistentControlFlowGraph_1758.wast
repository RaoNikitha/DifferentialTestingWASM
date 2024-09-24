;; 9. **Test `if` Block Exceeding Maximum Depth**:    - Write an `if` block nested to a depth exceeding acceptable limits, ensuring the CFG properly enforces maximum depth constraints.    - **Constraint Checked**: evaluates CFG’s capacity to enforce nested depth limitations.

(assert_invalid
  (module
    (func (result i32)
      (if (then
        (if (then
          (if (then
            (if (then
              (if (then
                (if (then
                  (if (then
                    (if (then
                      (if (then
                        (if (then
                          (if (then
                            (if (then
                              (if (then
                                (if (then
                                  (if (then
                                  )
                                ))
                              )
                            ))
                          )
                        ))
                      )
                    ))
                  )
                ))
              )
            ))
          )
        ))
      ))
    )
  )
  "exceeds maximum nested depth"
)