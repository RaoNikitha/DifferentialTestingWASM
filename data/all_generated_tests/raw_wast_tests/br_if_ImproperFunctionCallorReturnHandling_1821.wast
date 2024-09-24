;; 2. Test a `br_if` instruction in a nested function call, targeting a label outside the current function scope. Ensure that the function return values are correctly stacked after the conditional branch. This will check if wizard_engine handles label arguments differently due to its explicit fetching mechanism.

(assert_invalid
  (module
    (func (block (block (br_if 1 (i32.const 1)))))
  )
  "unknown label"
)