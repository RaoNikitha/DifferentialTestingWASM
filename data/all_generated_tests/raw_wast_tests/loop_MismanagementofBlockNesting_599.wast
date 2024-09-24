;; 10. **Nested Loop Depth Overflow Handling**:     - Test Description: Design a WebAssembly module with a high number of nesting levels, testing for overflow or incorrect branch target handling due to depth misinterpretations.     - Constraint: Ensure labels are correctly resolved without resulting in stack overflow or misrouted branches.     - Relation: This test probes extreme nesting cases and the system’s ability to maintain accurate label stacks and branch targets under deep nesting stress.

(assert_invalid
  (module
    (func $nested-loop-depth-overflow
      (loop $L0
        (loop $L1
          (loop $L2
            (loop $L3
              (loop $L4
                (loop $L5
                  (loop $L6
                    (loop $L7
                      (loop $L8
                        (loop $L9
                          (loop $L10
                            (loop $L11
                              (loop $L12
                                (loop $L13
                                  (loop $L14
                                    (loop $L15
                                      (loop $L16
                                        (loop $L17
                                          (loop $L18
                                            (loop $L19
                                              (loop $L20
                                                (loop $L21
                                                  (loop $L22
                                                    (loop $L23
                                                      (loop $L24
                                                        (loop $L25
                                                          (loop $L26
                                                            (loop $L27
                                                              (loop $L28
                                                                (loop $L29
                                                                  (loop $L30
                                                                    (loop $L31
                                                                      (loop $L32
                                                                        (loop $L33
                                                                          (loop $L34
                                                                            (loop $L35
                                                                              (loop $L36
                                                                                (loop $L37
                                                                                  (loop $L38
                                                                                    (loop $L39
                                                                                      (loop $L40
                                                                                        (loop $L41
                                                                                          (loop $L42
                                                                                            (loop $L43
                                                                                              (loop $L44
                                                                                                (loop $L45
                                                                                                  (loop $L46
                                                                                                    (loop $L47
                                                                                                      (loop $L48
                                                                                                        (loop $L49
                                                                                                          br $L0
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
                )
              )
            )
          )
        )
      )
    )
  )
  "stack overflow"
)