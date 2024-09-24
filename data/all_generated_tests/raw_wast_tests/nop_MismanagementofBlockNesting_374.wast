;; 6. Test a scenario with a nested `try`-`catch` block structure with intervening `nop` instructions to ensure that exception handling correctly propagates through the nested constructs without being affected by the `nop`.

(assert_invalid
  (module
    (func
      (try
        (do
          (try
            (do (nop))
            (catch (nop))
          )
        )
        (catch (nop))
      )
    )
  )
  "type mismatch"
)