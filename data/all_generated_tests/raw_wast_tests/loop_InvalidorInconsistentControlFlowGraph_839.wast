;; 10. Create a loop where the context incorrectly extends multiple nested labels, leading to erroneous label referencing and misuse, testing the robustness of CFG and context management regarding labels.

(assert_invalid
  (module (func $loop-nested-label-context
    (block (loop (param i32)
      (block (loop (br 3)))))))
  "type mismatch"
)