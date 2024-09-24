;; 4. **Test Description**: A deeply nested `loop` instruction inside another loop, where a branch from the outer loop should terminate, but due to label misinterpretation, it targets an `unreachable` in the inner loop:    - **Constraint Checked**: Label handling and correct termination of outer loop execution.    - **Unreachable Code Execution**: Mislabeling might cause control flow to erroneously reach `unreachable`.

(assert_invalid
  (module
    (func
      (loop $outer (param i32)
        (loop $inner (param i32)
          unreachable
        )
        br $outer
      )
    )
  )
  "unreachable executed"
)