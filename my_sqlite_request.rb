class MySqliteRequest
  def initialize; end
  def from(t); self; end
  def select(c); self; end
  def where(c, v); self; end
  def join(a, b, c); self; end
  def order(o, c); self; end
  def insert(t); self; end
  def values(d); self; end
  def update(t); self; end
  def set(d); self; end
  def delete; self; end
  def run; []; end
end