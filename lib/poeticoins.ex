defmodule Poeticoins do

  defdelegate subscribe_to_trades(product),
    to: Poeticoins.Exchanges, as: :subscribe

  defdelegate unsubscribe_from_trades(product),
    to: Poeticoins.Exchanges, as: :unsubscribe
end
